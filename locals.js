const ics = require("ics");
const icsHelper = require("./icsHelper.js");
const { writeFileSync, exists } = require("fs");

const initLecture = lecturename => {
  const lecture = require(`./api/lectures/${lecturename}/base.json`);
  if (lecture.maincontent !== null) {
    if (lecture.maincontent.lecture !== null) {
      lecture.maincontent.lecture.lectures = require(`./api/lectures/${lecturename}/lectures.json`);
    }
    if (lecture.maincontent.lab !== null) {
      lecture.maincontent.lab.labs = require(`./api/lectures/${lecturename}/labs.json`);
    }
    exists(`./api/lectures/${lecturename}/dates.json`, ex => {
      if (ex) {
        lecture.dates = require(`./api/lectures/${lecturename}/dates.json`);
      }

      if (lecture.maincontent.lecture !== null) {
        // generate ics
        const icsObjects = icsHelper.mkIcsObjs(lecture);
        const { error, value } = ics.createEvents(icsObjects);
        if (error) {
          console.log(error);
        }
        writeFileSync(`${__dirname}/ics/${lecturename}.ics`, value);
      }
      return lecture;
    });
  }
  return lecture;
};

const algdati = initLecture("algdati"); // require('./api/lectures/algdati.json')
const algdatii = initLecture("algdatii"); // require('./api/lectures/algdatii.json')
const compiler = initLecture("compiler"); // require('./api/lectures/compiler.json')
const fun = initLecture("fun"); // require('./api/lectures/fun.json')
const sa = initLecture("sa"); // require('./api/lectures/sa.json')
const seiib = initLecture("seiib"); // require('./api/lectures/seiib.json')
const seiiib = initLecture("seiiib"); // require('./api/lectures/seiiib.json')
const swengiib = initLecture("swengiib"); // require('./api/lectures/swengiib.json')
const swengiiib = initLecture("swengiiib"); // require('./api/lectures/swengiiib.json')
const vss = initLecture("vss"); // require('./api/lectures/vss.json')
const webtech = initLecture("webtech"); // require('./api/lectures/webtech.json')
const webtechFK12 = initLecture("webtechFK12"); // require('./api/lectures/webtechFK12.json')

const base = require("./api/base.json");

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
];

exports.lectures = lectures;

exports.currentSemester = {
  short: "WS 18/19",
  long: "Wintersemester 2018/19",
  lectures: [fun, swengiib, vss],
  semesters: [
    {
      filter: ".ws1819",
      label: "WS 18/19"
    },
    {
      filter: ".ss18",
      label: "SS 18"
    },
    {
      filter: ".ws1718",
      label: "WS 17/18"
    },
    {
      filter: ".ss17",
      label: "SS 17"
    },
    {
      filter: ".older",
      label: "DAVOR"
    }
  ]
};

exports.base = base;
