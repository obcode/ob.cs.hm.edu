const htmlStandards = require('reshape-standard')
const pageId = require('spike-page-id')
const env = process.env.NODE_ENV

module.exports = {
  matchers: { html: '*(**/)*.sgr' },
  ignore: ['**/layout.sgr', '**/_*', '**/.*', 'readme.md', 'yarn.lock'],
  reshape: htmlStandards({
    locals: (ctx) => { return { pageId: pageId(ctx), foo: 'bar' } },
    minify: env === 'production'
  }),
  vendor: ['assets/js/**', 'assets/cubeportfolio/js/**']
}
