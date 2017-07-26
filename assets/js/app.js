//Bizwrap 3.0 Jquery custom file
var $ = $.noConflict();
$(function () {
    "use strict";
    //preloader
    $(window).preloader({
        delay: 500
    });
    //sticky header on scroll
    $(window).on("scroll", function () {
        var scroll = $(window).scrollTop();

        if (scroll >= 1) {
            $(".sticky-nav").addClass("fixed-top");
        } else {
            $(".sticky-nav").removeClass("fixed-top");
        }
    });
    /**back to top**/
    $(window).on("scroll", function () {
        if ($(this).scrollTop() > 300) {
            $('.scrollToTop').fadeIn();
        } else {
            $('.scrollToTop').fadeOut();
        }
    });
    /**Click event to scroll to top**/
    $('.scrollToTop').on("click", function () {
        $('html, body').animate({scrollTop: 0}, 800);
        return false;
    });


    //search trigger
    jQuery('.icon-search, .search-close').on("click", function () {
        jQuery('.search-form-nav').animate({height: 'toggle'}, 500);
    });

    /**smooth scroll**/
    $('.smooth-scroll a[href*="#"]:not([href="#"])').on("click", function () {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                $('html, body').animate({
                    scrollTop: target.offset().top
                }, 1000);
                return false;
            }
        }
    });

    $('[data-toggle="tooltip"]').tooltip()
    $('.main-flex-slider,.testimonials').flexslider({
        slideshowSpeed: 5000,
        directionNav: false,
        animation: "fade"
    });

//wow scroll animation
    new WOW().init();
    ({
        boxClass: 'wow',
        animateClass: 'animated',
        offset: 30,
        live: true
    });

    //masonry blog post
    var $container = $('#mas-boxes');
    $container.imagesLoaded(function () {
        $container.masonry({
            itemSelector: '.mas-boxes-inner'
        });
    });
    /*****maginific popup **/
    $('.popup-container').each(function () {
        $(this).magnificPopup({
            delegate: 'a',
            type: 'image',
            mainClass: 'mfp-with-zoom',
            gallery: {
                enabled: true
            },
            zoom: {
                enabled: true,
                duration: 300,
                easing: 'ease-in-out',
                opener: function (openerElement) {
                    return openerElement.is('img') ? openerElement : openerElement.find('img');
                }
            }
        });
    });
    /**video popup**/
    $('.modal-video').magnificPopup({
        type: 'iframe'
    });

//transparent header onepage
    $(document).on("scroll", function () {
        if
                ($(document).scrollTop() > 100) {
            $(".transparent-header").addClass("shrink");
        } else
        {
            $(".transparent-header").removeClass("shrink");
        }
    });
});
