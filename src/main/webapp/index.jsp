<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Control center</title>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .row {
                padding: 20px;
            }

            .slider {
                border-radius: 3px;
                width: 100%;
            }

            .hue {
                background-image: linear-gradient(
                        to right,
                        red,
                        orange,
                        yellow,
                        green,
                        blue,
                        indigo,
                        violet,
                        red
                );
            }

            .brightness {
                background-image: linear-gradient(to right, darkgrey, white);
            }

            .hue > input,
            .brightness > input {
                width: 100%;
            }

            .btn-link {
                color: #000;
            }

            .btn-link:hover {
                color: darkgrey;
            }

            /*MENU*/
            .flex-column {
                width: 55px;
            }

            .nav > a{
                color: #000;
                border-top: 1px solid black;
            }

            .nav > a:hover, .nav > a:first-child:hover{
                color: darkgrey;
            }

            .nav > a:first-child{
                border-top: 0;
            }

        </style>
    </head>
    <body>

    <div class="flex-container">
        <div class="row">
            <div class="col-3">
                <nav class="nav flex-column">
                    <a class="nav-link active text-center" title="InLight Control Center." data-card="inlight-card" onclick="changeCard(this)"><i class="far fa-lightbulb fa-2x"></i></a>
                    <a class="nav-link text-center" title="Need to be implemented."><i class="fas fa-thermometer-half fa-2x"></i></a>
                </nav>
            </div>
            <div class="col-4 offset-1">
                <div class="card inlight-card" style="display: none;">
                    <div class="card-body">
                        <div class="row justify-content-center">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-6 offset-3">
                                        <h3>Inlight Control</h3>
                                    </div>
                                    <div class="col-1 offset-2">
                                        <button class="btn btn-link inlight-configuration" onclick="$('.inlight-card .card-content').slideToggle();"><i class="fas fa-cog fa-2x"></i></button>
                                    </div>
                                </div>
                                <div class="card-content">
                                    <div class="row justify-content-center">
                                        <div class="col-3">
                                            <button class="btn btn-md btn-default switch-on" data-group="0">Switch on</button>
                                        </div>
                                        <div class="col-3">
                                            <button class="btn btn-md btn-default" onclick="InLight.switchOff(0)">Switch off</button>
                                        </div>
                                    </div>
                                    <div class="row justify-content-center">
                                        <div class="col-3">
                                            <button class="btn btn-md btn-default" data-group="1">Switch on - 1</button>
                                        </div>
                                        <div class="col-3">
                                            <button class="btn btn-md btn-default" data-group="2">Switch on - 2</button>
                                        </div>
                                        <div class="col-3">
                                            <button class="btn btn-md btn-default" data-group="3">Switch on - 3</button>
                                        </div>
                                        <div class="col-3">
                                            <button class="btn btn-md btn-default" data-group="4">Switch on - 4</button>
                                        </div>
                                    </div>
                                    <div class="row justify-content-center">
                                        <div class="col-3">
                                            <button class="btn btn-md btn-default" onclick="InLight.switchOff(1)">Switch off - 1</button>
                                        </div>
                                        <div class="col-3">
                                            <button class="btn btn-md btn-default" onclick="InLight.switchOff(2)">Switch off - 2</button>
                                        </div>
                                        <div class="col-3">
                                            <button class="btn btn-md btn-default" onclick="InLight.switchOff(3)">Switch off - 3</button>
                                        </div>
                                        <div class="col-3">
                                            <button class="btn btn-md btn-default" onclick="InLight.switchOff(4)">Switch off - 4</button>
                                        </div>
                                    </div>
                                    <div class="row justify-content-center">
                                        <div class="col-8">
                                            <div class="brightness slider"><input name="brightness" type="range" min="1" max="100" value="50"></div>
                                        </div>
                                    </div>
                                    <div class="row justify-content-center">
                                        <div class="col-8">
                                            <div class="hue slider"><input name="hue" type="range" min="1" max="360" value="130"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-content" style="display: none;">
                                    <div class="row">
                                        <div class="col">
                                            <div class="col controller-ip">Controller not found.</div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <button class="btn btn-md btn-default" onclick="InLight.findController()">Find my controller</button>
                                        </div>
                                        <div class="col">
                                            <input type="text" class="form-control" placeholder="Host"/>
                                            <label>Leave empty if not sure.</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/in-light.js"></script>
    </body>
</html>