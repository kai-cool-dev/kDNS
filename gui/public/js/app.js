function myLog(data)
{
  console.log("======");
  console.log("kDNS:");
  console.log(data);
  console.log("======");
}

function functionmodal(data)
{
  $('#nameserverModal').modal('toggle');
}

function savemodal()
{
  var nameserver = $("#nameserver").val() || [];
  myLog(nameserver);
  $('#newcontent').val(nameserver);
  $('#nameserverModal').modal('toggle');
}

document.getElementById('newtype').addEventListener('change', function(event){
    var elem = event.target;
    if(elem.value == "NS"){
      functionmodal(elem.value);
    }
});
