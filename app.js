const htmlStandards = require('reshape-standard')
//  const jsStandards = require('spike-js-standards')
const pageId = require('spike-page-id')
const env = process.env.NODE_ENV

module.exports = {
  // devtool: 'source-map',
  matchers: { html: '*(**/)*.sgr' },
  ignore: ['**/layout.sgr', '**/_*', '**/.*', 'readme.md', 'yarn.lock'],
  reshape: htmlStandards({
    locals: (ctx) => { return { pageId: pageId(ctx), foo: 'bar' } },
    minify: env === 'production'
  })
//  babel: jsStandards()
}
