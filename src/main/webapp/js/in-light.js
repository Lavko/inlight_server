var controllerIp = '';
var InLight = {
    initialize: function() {
        this.initializeDoubleClickOn();
        this.initializeSliders();
        this.initializeWiFiBox();
    },
    initializeDoubleClickOn: function() {
        var DELAY = 300, clicks = 0, timer = null;
        $(function(){
            $(".switch-on").on("click", function(e){
                clicks++;
                if(clicks === 1) {
                    timer = setTimeout(function() {
                        InLight.switchOn($(e.target).data().group);
                        clicks = 0;
                    }, DELAY);
                } else {
                    clearTimeout(timer);
                    InLight.setWhite($(e.target).data().group);
                    clicks = 0;
                }
            })
            .on("dblclick", function(e){
                e.preventDefault();
            });
        });
    },
    initializeSliders: function() {
        var hue = 130;
        var hueSlider = $('.hue > input');
        hueSlider.on('input', function () {
            hue = hueSlider.val();
            InLight.setHue(hue);
        });

        var brightness = 0;
        var brightnessSlider = $('.brightness > input');
        brightnessSlider.on('input', function () {
            brightness = brightnessSlider.val();
            InLight.setBrightness(brightness);
        });
    },
    initializeWiFiBox: function() {
        if(controllerIp === 'undefined' || controllerIp === '') {
            $('.inlight-card .card-content').slideToggle();
            $('.inlight-configuration').attr("disabled", "disabled");
        }
    },
    findController: function() {
        $.ajax({
            url: '/inlight/findMyController',
            type: 'GET',
            contentType: 'application/json; charset=utf-8',
            success: function(result) {
                $(".controller-ip").text(result);
                controllerIp = result;
                $('.inlight-card .card-content').slideToggle();
                $('.inlight-configuration').prop("disabled", false);
            },
            error: function (jqXHR, status, error) {
                console.log(error);
            }
        });
    },
    switchOn: function(group) {
        $.ajax({
            url: '/inlight/switchOn?group=' + group,
            type: 'GET',
            contentType: 'application/json; charset=utf-8',
            error: function (jqXHR, status, error) {
                console.log(error);
            }
        });
    },
    switchOff: function(group) {
        $.ajax({
            url: '/inlight/switchOff?group=' + group,
            type: 'GET',
            contentType: 'application/json; charset=utf-8',
            error: function (jqXHR, status, error) {
                console.log(error);
            }
        });
    },
    setBrightness: function(value) {
        $.ajax({
            url: '/inlight/setBrightness?group=0&percent=' + value,
            type: 'GET',
            contentType: 'application/json; charset=utf-8',
            error: function (jqXHR, status, error) {
                console.log(error);
            }
        });
    },
    setWhite: function(group) {
        $.ajax({
            url: '/inlight/setWhite?group=' + group,
            type: 'GET',
            contentType: 'application/json; charset=utf-8',
            error: function (jqXHR, status, error) {
                console.log(error);
            }
        });
    },
    setHue: function(value) {
        $.ajax({
            url: '/inlight/setHue?group=0&hue=' + value,
            type: 'GET',
            contentType: 'application/json; charset=utf-8',
            error: function (jqXHR, status, error) {
                console.log(error);
            }
        });
    }
}

$( document ).ready(function() {
    InLight.initialize();
} );

function changeCard(e) {
    var selectedCard = $(e).data().card;
    $(".card").each(function(i, card) {
        var cardElement = $(card);
        if(cardElement.is(":visible")) {
            if(!cardElement.hasClass(selectedCard)) {
                cardElement.slideUp();
            }
        }else {
            if(cardElement.hasClass(selectedCard)) {
                cardElement.slideDown();
            }
        }
    })
}