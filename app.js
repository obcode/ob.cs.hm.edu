const htmlStandards = require('reshape-standard')
const pageId = require('spike-page-id')
const env = process.env.NODE_ENV
const locals = require('./locals.js')

const lecture = (ctx) => {
  const pathParts = ctx.resourcePath.split('/')
  const filenameParts = pathParts[pathParts.length - 1].split('.')
  const lectureName = filenameParts[0]
  return locals.lectures.find(l => l.short === lectureName)
}

module.exports = {
  matchers: { html: '*(**/)*.sgr' },
  ignore: ['**/layout.sgr', '**/_*', '**/.*', 'readme.md', 'yarn.lock',
    '**/withPortfolio.sgr', '**/lecture.sgr', '**/includes/*.sgr'],
  reshape: htmlStandards({
    locals: (ctx) => {
      return {
        myctx: JSON.stringify(Object.keys(ctx)),
        pageId: pageId(ctx),
        currentLecture: lecture(ctx),
        lectures: locals.lectures,
        currentSemester: locals.currentSemester
      }
    },
    root: '/Users/obraun/lectures/sw/ob.cs.hm.edu/views',
    minify: env === 'production'
  }),
  vendor: ['assets/js/**', 'assets/cubeportfolio/js/**']
}
