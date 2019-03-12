const mkStarttimes = daytimes => {
  return daytimes.map(d => mkStarttime(d));
};

const mkStarttime = daytime => {
  // daytime = "montags, 08:15 - 09:45";
  const res = daytime.split(" ");
  const starttime = res[1].split(":");
  const starthour = parseInt(starttime[0]);
  const startminute = parseInt(starttime[1]);
  return [starthour, startminute];
};

const splitTime = time => {
  // daytime = "08:15";
  const res = time.split(":");
  const hour = parseInt(res[0]);
  const minute = parseInt(res[1]);
  return [hour, minute];
};

const mkEndtimes = daytimes => {
  return daytimes.map(d => mkEndtime(d));
};

const mkEndtime = daytime => {
  // daytime = "montags, 08:15 - 09:45";
  const res = daytime.split(" ");
  const endtime = res[3].split(":");
  const endhour = parseInt(endtime[0]);
  const endminute = parseInt(endtime[1]);
  return [endhour, endminute];
};

const dateToArrs = dates => {
  const dateArrs = dates.map(d => dateToArr(d.date));
  return dateArrs;
};

const dateToArr = date => {
  // var date = "19.03.2018";
  const res = date.split(".");
  const day = parseInt(res[0]);
  const month = parseInt(res[1]);
  let year = parseInt(res[2]);
  if (year < 100) {
    year += 2000;
  }
  return [year, month, day];
};

const lectureToEvent = (lect, lectureStarttime, lectureEndtime, lecture) => {
  const dateArr = dateToArr(lect.date);
  return {
    title: `VL ${lecture.short}: ${lect.topic}`,
    start: dateArr.concat(lectureStarttime),
    end: dateArr.concat(lectureEndtime),
    location:
      lect.room === undefined ? lecture.maincontent.lecture.room : lect.room
  };
};

const labToEvent = (
  lab,
  labStarttimes,
  labEndtimes,
  labRooms,
  labNames,
  lecture
) => {
  const dateArrs = dateToArrs(lab.dates);
  let dateArr = null;
  if (dateArrs.length < labStarttimes.length) {
    dateArr = dateArrs[0];
  }
  let events = [];
  for (let i in labStarttimes) {
    const labName = labNames[i] === null ? "" : ` (${labNames[i]})`;
    let date = dateArr;
    if (date === null) {
      date = dateArrs[i];
    }
    if (lab.dates[i] === undefined || !lab.dates[i].cancelled) {
      let room = labRooms[i];
      if (lab.rooms !== undefined && lab.rooms !== null) {
        for (let r of lab.rooms) {
          const time = r.time
            .split(" ")[0]
            .split(":")
            .map(s => parseInt(s));
          if (time[0] === labStarttimes[i][0]) {
            room = r.room;
          }
        }
      }
      events.push({
        title: `P ${lecture.short}: ${lab.topic} ${labName}`,
        start: date.concat(labStarttimes[i]),
        end: date.concat(labEndtimes[i]),
        location: room
      });
    }
  }
  return events;
};

const mkIcsObjs = lecture => {
  const lectures = lecture.maincontent.lecture.lectures;
  const lectureStarttime = mkStarttime(lecture.maincontent.lecture.daytime);
  const lectureEndtime = mkEndtime(lecture.maincontent.lecture.daytime);
  let icsObjs = [];
  for (let lectIdx in lectures) {
    const lect = lectures[lectIdx];
    if (!lect.cancelled) {
      icsObjs.push(
        lectureToEvent(lect, lectureStarttime, lectureEndtime, lecture)
      );
    }
  }
  const labs = lecture.maincontent.lab.labs;
  const labdaytimes = lecture.maincontent.lab.groups.map(g => g.daytime);
  const labStarttimes = mkStarttimes(labdaytimes);
  const labEndtimes = mkEndtimes(labdaytimes);
  const labRooms = lecture.maincontent.lab.groups.map(g => g.room);
  const labNames = lecture.maincontent.lab.groups.map(g => g.name);
  for (let labIdx in labs) {
    const lab = labs[labIdx];
    if (!lab.cancelled) {
      const labEvents = labToEvent(
        lab,
        labStarttimes,
        labEndtimes,
        labRooms,
        labNames,
        lecture
      );
      icsObjs = icsObjs.concat(labEvents);
    }
  }
  if (lecture.dates !== undefined) {
    for (let idx in lecture.dates) {
      const event = lecture.dates[idx];
      const date = dateToArr(event.date).concat(splitTime(event.time));
      const time = icsObjs.push({
        title: `${lecture.short}: ${event.title}`,
        start: date,
        end: date
      });
    }
  }
  return icsObjs;
};

exports.mkIcsObjs = mkIcsObjs;
