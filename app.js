const htmlStandards = require('reshape-standard')
const pageId = require('spike-page-id')
const ImageminPlugin = require('imagemin-webpack-plugin').default
const imageminMozjpeg = require('imagemin-mozjpeg')
const env = process.env.NODE_ENV
const locals = require('./locals.js')

const lecture = (ctx) => {
  const pathParts = ctx.resourcePath.split('/')
  const filenameParts = pathParts[pathParts.length - 1].split('.')
  const lectureName = filenameParts[0]
  return locals.lectures.find(l => l.short === lectureName)
}

module.exports = {
  matchers: {
    html: '*(**/)*.sgr'
  },
  ignore: ['**/layouts/*.sgr', '**/_*', '**/.*', 'readme.md', 'yarn.lock',
    '**/includes/**/*.sgr', 'package-lock.json', 'public.git/**'
  ],
  reshape: htmlStandards({
    locals: (ctx) => {
      return {
        myctx: JSON.stringify(Object.keys(ctx)),
        pageId: pageId(ctx),
        currentLecture: lecture(ctx),
        lectures: locals.lectures,
        currentSemester: locals.currentSemester,
        base: locals.base
      }
    },
    root: process.cwd() + '/views',
    minify: env === 'production'
  }),
  vendor: ['assets/js/**', 'assets/cubeportfolio/js/**'],
  afterSpikePlugins: [
    new ImageminPlugin({
      disable: process.env.NODE_ENV !== 'production',
      test: 'img/**',
      plugins: [
        imageminMozjpeg({
          quality: 85,
          progressive: true
        })
      ]
    })
  ]
}
