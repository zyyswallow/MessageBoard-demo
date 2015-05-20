/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function clearTextArea() {
    document.getElementById("textContent").value = "";
    document.getElementById("textContent").focus();
}

function submitMessage() {
    var IP = document.getElementById("IPAddress").value;
    var content = document.getElementById("textContent").value;
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "InsertMessage?IP=" + IP + "&content=" + content, true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var res = xhr.responseText;
//            alert(res);
            alert("留言成功！");
            window.location.href = "index.jsp";

        }
    };
}

//第一种方法（javascript）
window.onload = function () {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "getIPAddress", true);
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                var res = xhr.responseText;
                document.getElementById("IPAddress").value = res;
            } else {
                document.getElementById("IPAddress").value = "未知";
            }
        }
    }
}

//第二种方法（jquery）

//$(document).ready(function(){
//    alert("begin");
//    $.ajax({
//            type: "GET",
//            url: "getIPAddress",
//            success: function(data) {
//                $("#IPAddress").val(data);
//            },
//            error: function() {
//                alert("获取IP失败");
//                $("#IPAddress").val("未知");
//            }
//        });
//}); 


