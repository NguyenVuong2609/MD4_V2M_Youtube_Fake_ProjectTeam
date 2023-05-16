<%--
Created by IntelliJ IDEA.
User: Admin
Date: 10/3/2022
Time: 4:07 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>

    </style>
</head>
<body>

<%--<form method="post">--%>

    <progress value="0" max="100" id="uploaderVideo" style="width: 100%;">0%</progress><br>
    <input type="file" value="uploadVideo" accept=".mp4" id="fileButtonVideo">
    <input name="videoLink" type="text" id="videoLink" style="display: none">
    <div id="videoDiv"></div>
<%--    <button type="submit">Upload</button>--%>
<%--</form>--%>
<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase.js"></script>
<%--<script>--%>

<%--    //BE SURE TO PROTECT EVERYTHING IN THE CONFIG--%>
<%--    //DON'T COMMIT IT!!!--%>

<%--    // Initialize Firebase--%>
<%--    const firebaseConfig = {--%>
<%--        apiKey: "AIzaSyAHbXIdiO5i-nOweX-szmiNn4JSyrOjDi4",--%>
<%--        authDomain: "chinhbeo-18d3b.firebaseapp.com",--%>
<%--        databaseURL: "https://chinhbeo-18d3b.firebaseio.com",--%>
<%--        projectId: "chinhbeo-18d3b",--%>
<%--        storageBucket: "chinhbeo-18d3b.appspot.com",--%>
<%--        messagingSenderId: "197467443558",--%>
<%--        appId: "1:197467443558:web:7cccdbe875f827eb84b8a7",--%>
<%--        measurementId: "G-D375CXH5LG"--%>
<%--    };--%>
<%--    firebase.initializeApp(firebaseConfig);--%>
<%--</script>--%>

<script type="text/javascript">
    // const firebaseConfig = {
    //     apiKey: "AIzaSyA77N_ysoRaVII4Lu4JHY_c-z2Ej7mJKRs",
    //     authDomain: "vuongcuti-6ce58.firebaseapp.com",
    //     projectId: "vuongcuti-6ce58",
    //     storageBucket: "vuongcuti-6ce58.appspot.com",
    //     messagingSenderId: "268262293286",
    //     appId: "1:268262293286:web:8cd35e7267375745d04be7",
    //     measurementId: "G-E7PQZW5JV2"
    // };
    firebase.initializeApp(firebaseConfig);

    var video = '';
    // firebase bucket name
    // REPLACE WITH THE ONE YOU CREATE
    // ALSO CHECK STORAGE RULES IN FIREBASE CONSOLE
    var fbBucketName = 'images';

    // get elements
    var uploaderVideo = document.getElementById('uploaderVideo');
    var fileButtonVideo = document.getElementById('fileButtonVideo');

    // listen for file selection
    fileButtonVideo.addEventListener('change', function (e) {

        // what happened
        console.log('file upload event', e);

        // get file
        var file = e.target.files[0];

        // create a storage ref
        <%--var storageRef = firebase.storage().ref(`${fbBucketName}/${file.name}`);--%>
        const storageRef = firebase.storage().ref(file.name);
        // upload file
        var uploadTask = storageRef.put(file);

        // The part below is largely copy-pasted from the 'Full Example' section from
        // https://firebase.google.com/docs/storage/web/upload-files

        // update progress bar
        uploadTask.on(firebase.storage.TaskEvent.STATE_CHANGED, // or 'state_changed'
            function (snapshot) {
                // Get task progress, including the number of bytes uploaded and the total number of bytes to be uploaded
                var progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                uploaderVideo.value = progress;
                console.log('Upload is ' + progress + '% done');
                switch (snapshot.state) {
                    case firebase.storage.TaskState.PAUSED: // or 'paused'
                        console.log('Upload is paused');
                        break;
                    case firebase.storage.TaskState.RUNNING: // or 'running'
                        console.log('Upload is running');
                        break;
                }
            }, function (error) {

                // A full list of error codes is available at
                // https://firebase.google.com/docs/storage/web/handle-errors
                switch (error.code) {
                    case 'storage/unauthorized':
                        // User doesn't have permission to access the object
                        break;

                    case 'storage/canceled':
                        // User canceled the upload
                        break;

                    case 'storage/unknown':
                        // Unknown error occurred, inspect error.serverResponse
                        break;
                }
            }, function () {
                // Upload completed successfully, now we can get the download URL
                // save this link somewhere, e.g. put it in an input field
                var downloadURL = uploadTask.snapshot.downloadURL;
                video = downloadURL;
                console.log('downloadURL ===>', downloadURL);
                let divLocation = document.getElementById("videoDiv");
                // let imgElement = document.createElement("img");
                // imgElement.src = downloadURL
                // imgElement.width = 100;
                // imgElement.height = 100;
                // console.log('pic ==', downloadURL)
                var x = document.createElement("video");

                if (x.canPlayType("video/mp4")) {
                    x.setAttribute("src",downloadURL);
                } else {
                    x.setAttribute("src",downloadURL);
                }

                x.setAttribute("controls", downloadURL);
                document.body.appendChild(x);
                divLocation.append(x);
                document.getElementById('videoLink').value = downloadURL;
            });

    });

    // function resultImage(){
    //   console.log('image resulte -->', image)
    //   return image;
    // }
</script>
</body>
</html>