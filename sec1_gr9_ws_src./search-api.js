/* ITCS212 - Web Programming Project
 * TBSP - Table Spoon
 * Section: 1   Group: 9
 * 6388009 Rungpilin, 6388013 Jomchai, 6388122 Warisa, 6388123 Kornkanok 
 */

var data;
var songlist;
var songresult;
var songlistid;

function search() {
    document.getElementById('results').innerHTML = null; //clear last results before next search
    let type = document.getElementById("searchtype").value;
    let query = document.getElementById("txtSearch").value; // Get query from a textbox 
    console.log(type +" / "+ query);
    let rooturl = "http://localhost:5503/search/"+type+"/"+query;

    fetch(rooturl)
    .then((res) => res.json()) // Get JSON from the response 
    .then((data) => { //data utilization
       console.log(data);
        if(data.data.length == 0){
            document.getElementById('results').innerHTML = "<h2 style=\"text-align: center;\">There's no Results found :( </h2>";
        }else{
            for(var i in data.data){
                document.getElementById('results').innerHTML += "<div class=\"allsong\"><div class=\"songcontainer\"><img src=\""+ data.data[i].Pic+
                "\"> <div clas=\"songdesc\"><div class=\"songname\">"+ data.data[i].Name+"</div><div class=\"songartist\">"+ data.data[i].Artist+"</div></div></div>";
            }
            gettoken();
        }
    })
    .catch((err) => console.log(err));
}

//for spotify
var token = "";
function gettoken() {
    var client = btoa('ccfc155474974aba81ab49afb4a1bb3c:c7bec99f525b46dda3104fb1c7a41fed'); //convert ids to base-64 by using client id and client id secret
    console.log(client);
    $.ajax({
        url: 'https://accounts.spotify.com/api/token?grant_type=client_credentials',
        type: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        headers: {
            'Authorization': 'Basic ' + client
        },
        success: function (response) {
            console.log(response);
            token = response.access_token;
            getmusic(token);
        }
    })
}
var type = "playlist" //get playlist type
function getmusic(tokenurl) {
    console.log($("#txtSearch").val());
    $.ajax({
        url: "https://api.spotify.com/v1/search?q=" + data + "+soundtrack&type=" + type + "&market=TH&limit=1",
        type: 'GET',
        contentType: 'application/json',
        Accepts: 'application/json',
        headers: {
            "Authorization": 'Bearer ' + tokenurl
        },
        contentType: 'application/json; charset=utf-8',
        success: function (result) {
            //get playlist result
            console.log(result);
            songlist = result.playlists.items[0]; //get music playlist items
            songresult = "";
            songlistid = songlist.id;
            console.log(songlistid);
            songresult = '<p align ="center"><iframe src="https://open.spotify.com/embed/playlist/' + songlistid + '" +width="300" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe></p>';
            $("#public-results").html(songresult); //get result
        },
        error: function (error) {
            console.log(error);
        }
    });
}