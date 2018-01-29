const algdati = require('./api/lectures/algdati.json')
const algdatii = require('./api/lectures/algdatii.json')
const compiler = require('./api/lectures/compiler.json')
const fun = require('./api/lectures/fun.json')
const sa = require('./api/lectures/sa.json')
const seiib = require('./api/lectures/seiib.json')
const seiiib = require('./api/lectures/seiiib.json')
const swengiib = require('./api/lectures/swengiib.json')
const swengiiib = require('./api/lectures/swengiiib.json')
const vss = require('./api/lectures/vss.json')
const webtech = require('./api/lectures/webtech.json')
const webtechFK12 = require('./api/lectures/webtechFK12.json')
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
  semesters: [
    {
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
