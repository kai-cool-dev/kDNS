function myLog(data)
{
  console.log("======");
  console.log("kDNS:");
  console.log(data);
  console.log("======");
}

if(nserror === true)
{
  $('#nameserverModal').modal('toggle');
}

function functionmodal()
{
  if($('#newtype').val() == "NS")
  {
    $('#nameserverModal').modal('toggle');
  }
  if($('#newtype').val() == "MX")
  {
    $('#mxserverModal').modal('toggle');
  }
}

function nameserversave()
{
  var nameserver = $("#nameserver").val() || [];
  $('#newtype').val("NS");
  $('#newcontent').val(nameserver);
  $('#nameserverModal').modal('toggle');
}

function mxserversave()
{
  $('#newcontent').val($("#mailserver").val());
  $('#newprio').val($("#mxprio").val());
  $('#newtype').val("MX");
  $('#mxserverModal').modal('toggle');
}

$('#newtype').change(function(){
  functionmodal();
});

$('#newcontent').click(function(){
  functionmodal();
});

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
