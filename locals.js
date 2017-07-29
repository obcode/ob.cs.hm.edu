const algdati = require('./lectures/algdati.json')
const algdatii = require('./lectures/algdatii.json')
const compiler = require('./lectures/compiler.json')
const fun = require('./lectures/fun.json')
const sa = require('./lectures/sa.json')
const seiib = require('./lectures/seiib.json')
const seiiib = require('./lectures/seiiib.json')
const swengiib = require('./lectures/swengiib.json')
const swengiiib = require('./lectures/swengiiib.json')
const webtech = require('./lectures/webtech.json')
const webtechFK12 = require('./lectures/webtechFK12.json')

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
  webtech,
  webtechFK12
]

exports.lectures = lectures

exports.currentSemester = {
  short: 'WS 17/18',
  long: 'Wintersemester 2017/18',
  lectures: [
    algdati,
    fun,
    seiib
  ],
  semesters: [
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
      filter: '.ss16',
      label: 'SS 16'
    },
    {
      filter: '.older',
      label: 'DAVOR'
    }
  ]
}

exports.filesPrefix = 'https://dl.dropboxusercontent.com/u/13563262/lectures'
