const ics = require('ics')
const {
  writeFileSync
} = require('fs')

const initLecture = (lecturename) => {
  const lecture = require(`./api/lectures/${lecturename}/base.json`)
  if (lecture.maincontent !== null) {
    if (lecture.maincontent.lecture !== null) {
      lecture.maincontent.lecture.lectures =
        require(`./api/lectures/${lecturename}/lectures.json`)
    }
    if (lecture.maincontent.lab !== null) {
      lecture.maincontent.lab.labs =
        require(`./api/lectures/${lecturename}/labs.json`)
    }
    if (lecture.maincontent.lecture !== null) {
      // generate ics
      const icsObjects = mkIcsObjs(lecture)
      const {
        error,
        value
      } = ics.createEvents(icsObjects)
      if (error) {
        console.log(error)
      }
      writeFileSync(`${__dirname}/ics/${lecturename}.ics`, value)
    }
  }
  return lecture
}

const mkStarttimes = (daytimes) => {
  return daytimes.map(d => mkStarttime(d))
}

const mkStarttime = (daytime) => {
  // daytime = "montags, 08:15 - 09:45";
  const res = daytime.split(' ')
  const starttime = res[1].split(':')
  const starthour = parseInt(starttime[0])
  const startminute = parseInt(starttime[1])
  return [starthour, startminute]
}

const mkEndtimes = (daytimes) => {
  return daytimes.map(d => mkEndtime(d))
}

const mkEndtime = (daytime) => {
  // daytime = "montags, 08:15 - 09:45";
  const res = daytime.split(' ')
  const endtime = res[3].split(':')
  const endhour = parseInt(endtime[0])
  const endminute = parseInt(endtime[1])
  return [endhour, endminute]
}

const dateToArrs = (dates) => {
  return dates.map(d => dateToArr(d))
}

const dateToArr = (date) => {
  // var date = "19.03.2018";
  const res = date.split('.')
  const day = parseInt(res[0])
  const month = parseInt(res[1])
  const year = parseInt(res[2])
  return [year, month, day]
}

const lectureToEvent = (lect, lectureStarttime, lectureEndtime, lecture) => {
  const dateArr = dateToArr(lect.date)
  return {
    title: `VL ${lecture.short}: ${lect.topic}`,
    start: dateArr.concat(lectureStarttime),
    end: dateArr.concat(lectureEndtime),
    location: lecture.maincontent.lecture.room
  }
}

const labToEvent = (lab, labStarttimes, labEndtimes, labRooms, labNames, lecture) => {
  const dateArrs = dateToArrs(lab.dates)
  let dateArr = null
  if (dateArrs.length < labStarttimes.length) {
    dateArr = dateArrs[0]
  }
  let events = []
  for (let i in labStarttimes) {
    let date = dateArr
    if (date === null) {
      date = dateArrs[i]
    }
    events.push({
      title: `P ${lecture.short}: ${lab.topic} (${labNames[i]})`,
      start: date.concat(labStarttimes[i]),
      end: date.concat(labEndtimes[i]),
      location: labRooms[i]
    })
  }
  // console.log(events)
  return events
}

const mkIcsObjs = (lecture) => {
  const lectures = lecture.maincontent.lecture.lectures
  const lectureStarttime = mkStarttime(lecture.maincontent.lecture.daytime)
  const lectureEndtime = mkEndtime(lecture.maincontent.lecture.daytime)
  let icsObjs = []
  for (let lectIdx in lectures) {
    const lect = lectures[lectIdx]
    if (!lect.cancelled) {
      icsObjs.push(lectureToEvent(lect, lectureStarttime, lectureEndtime, lecture))
    }
  }
  const labs = lecture.maincontent.lab.labs
  const labdaytimes = lecture.maincontent.lab.groups.map(g => g.daytime)
  const labStarttimes = mkStarttimes(labdaytimes)
  const labEndtimes = mkEndtimes(labdaytimes)
  const labRooms = lecture.maincontent.lab.groups.map(g => g.room)
  const labNames = lecture.maincontent.lab.groups.map(g => g.name)
  for (let labIdx in labs) {
    const lab = labs[labIdx]
    if (!lab.cancelled) {
      const labEvents = labToEvent(lab, labStarttimes, labEndtimes, labRooms, labNames, lecture)
      // console.log(labEvents)
      icsObjs = icsObjs.concat(labEvents)
    }
  }
  return icsObjs
}

const algdati = initLecture('algdati') // require('./api/lectures/algdati.json')
const algdatii = initLecture('algdatii') // require('./api/lectures/algdatii.json')
const compiler = initLecture('compiler') // require('./api/lectures/compiler.json')
const fun = initLecture('fun') // require('./api/lectures/fun.json')
const sa = initLecture('sa') // require('./api/lectures/sa.json')
const seiib = initLecture('seiib') // require('./api/lectures/seiib.json')
const seiiib = initLecture('seiiib') // require('./api/lectures/seiiib.json')
const swengiib = initLecture('swengiib') // require('./api/lectures/swengiib.json')
const swengiiib = initLecture('swengiiib') // require('./api/lectures/swengiiib.json')
const vss = initLecture('vss') // require('./api/lectures/vss.json')
const webtech = initLecture('webtech') // require('./api/lectures/webtech.json')
const webtechFK12 = initLecture('webtechFK12') // require('./api/lectures/webtechFK12.json')

const base = require('./api/base.json')

const lectures = [
  algdati,
  algdatii,
  compiler,
  fun,
  sa,
  seiib,
  seiiib,
  swengiib,
  swengiiib,
  vss,
  webtech,
  webtechFK12
]

exports.lectures = lectures

exports.currentSemester = {
  short: 'SS 18',
  long: 'Sommersemester 2018',
  lectures: [
    algdatii,
    seiiib,
    vss
  ],
  semesters: [{
      filter: '.ss18',
      label: 'SS 18'
    },
    {
      filter: '.ws1718',
      label: 'WS 17/18'
    },
    {
      filter: '.ss17',
      label: 'SS 17'
    },
    {
      filter: '.ws1617',
      label: 'WS 16/17'
    },
    {
      filter: '.older',
      label: 'DAVOR'
    }
  ]
}

exports.base = base
