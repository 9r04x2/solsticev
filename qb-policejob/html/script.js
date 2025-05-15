HeliCam = {}

HeliCam.Open = function(data) {
    $("#helicontainer").css("display", "block");
    $(".scanBar").css("height", "0%");
}

HeliCam.UpdateScan = function(data) {
    $(".scanBar").css("height", data.scanvalue +"%");
}

HeliCam.UpdateVehicleInfo = function(data) {
    $(".vehicleinfo").css("display", "block");
    $(".scanBar").css("height", "100%");
    $(".heli-model").find("p").html("MODEL: " + data.model);
    $(".heli-plate").find("p").html("PLATE: " + data.plate);
    $(".heli-street").find("p").html(data.street);
    $(".heli-speed").find("p").html(data.speed + " KM/U");
}

HeliCam.DisableVehicleInfo = function() {
    $(".vehicleinfo").css("display", "none");
}

HeliCam.Close = function() {
    $("#helicontainer").css("display", "none");
    $(".vehicleinfo").css("display", "none");
    $(".scanBar").css("height", "0%");
}

document.onreadystatechange = () => {
    if (document.readyState === "complete") {
        window.addEventListener('message', function(event) {
            if (event.data.type == "enablecam") {
                CameraApp.OpenCameras(event.data.label, event.data.connected, event.data.id, event.data.time);
            } else if (event.data.type == "disablecam") {
                CameraApp.CloseCameras();
            } else if (event.data.type == "updatecam") {
                CameraApp.UpdateCameraLabel(event.data.label);
            } else if (event.data.type == "updatecamtime") {
                CameraApp.UpdateCameraTime(event.data.time);
            } else if (event.data.type == "heliopen") {
                HeliCam.Open(event.data);
            } else if (event.data.type == "heliclose") {
                HeliCam.Close();
            } else if (event.data.type == "heliscan") {
                HeliCam.UpdateScan(event.data);
            } else if (event.data.type == "heliupdateinfo") {
                HeliCam.UpdateVehicleInfo(event.data);
            } else if (event.data.type == "disablescan") {
                HeliCam.DisableVehicleInfo();
            }
        });
    };
};

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27:
            break;
    }
});