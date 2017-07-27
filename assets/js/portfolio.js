  (function ($$, window, document, undefined) {
    'use strict';

    // init cubeportfolio
    $$('#js-grid-awesome-work').cubeportfolio({
      filters: '#js-filters-awesome-work',
      layoutMode: 'grid',
      defaultFilter: '*',
      animationType: 'scaleSides',
      gapHorizontal: 30,
      gapVertical: 30,
      gridAdjustment: 'responsive',
      mediaQueries: [{
        width: 1500,
        cols: 4
      }, {
        width: 1100,
        cols: 3
      }, {
        width: 480,
        cols: 2,
        options: {
          gapHorizontal: 15,
          gapVertical: 15
        }
      }],
      caption: 'zoom',
      displayType: 'fadeIn',
      displayTypeSpeed: 400,
      // singlePage popup
      singlePageDelegate: '.cbp-singlePage',
      singlePageDeeplinking: true,
      singlePageStickyNavigation: true,
      singlePageCounter: '<div class="cbp-popup-singlePage-counter">{{current}} of {{total}}</div>'
    });
  })(jQuery, window, document);
