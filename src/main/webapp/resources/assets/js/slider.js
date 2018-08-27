/* ============================================================
 * Sliders
 * Sliders using Ion Slider and noUiSlider jQuery Plugins
 * For DEMO purposes only. Extract what you need.
 * ============================================================ */
(function($) {

    'use strict';

    $(document).ready(function() {
        $(".ion_slider").ionRangeSlider({
            min: 0,
            max: 5000,
            type: 'double',
            prefix: "DZD",
            maxPostfix: "+",
            prettify_enabled: false,
            grid: true
        });
        $("#example_1").ionRangeSlider({
            min: 0,
            max: 5000,
            type: 'double',
            prefix: "$",
            maxPostfix: "+",
            prettify_enabled: false,
            grid: true
        });

        $("#example_2").ionRangeSlider({
            min: 1000,
            max: 100000,
            from: 30000,
            to: 90000,
            type: 'double',
            step: 500,
            postfix: " €",
            grid: true
        });

        $("#example_3").ionRangeSlider({
            min: 0,
            max: 10,
            type: 'single',
            step: 0.1,
            postfix: " carats",
            prettify_enabled: false,
            grid: true
        });

        $("#example_4").ionRangeSlider({
            min: -50,
            max: 50,
            from: 0,
            postfix: "°",
            prettify_enabled: false,
            grid: true
        });

        $("#example_5").ionRangeSlider({
            values: [
                "January", "February",
                "March", "April",
                "May", "June",
                "July", "August",
                "September", "October",
                "November", "December"
            ],
            type: 'single',
            grid: true
        });

        $("#example_6").ionRangeSlider({
            min: 10000,
            max: 100000,
            step: 1000,
            postfix: " miles",
            from: 55000,
            hideMinMax: false,
            hideFromTo: true
        });

    });

    //NOUI SLIDER //

     

})(window.jQuery);