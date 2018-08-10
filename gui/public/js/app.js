function myLog(data)
{
  console.log("======");
  console.log("kDNS:");
  console.log(data);
  console.log("======");
}

function functionmodal()
{
  if($('#newtype').val() == "NS")
  {
    $('#nameserverModal').modal('toggle');
  }
}

function savemodal()
{
  var nameserver = $("#nameserver").val() || [];
  $('#newcontent').val(nameserver);
  $('#nameserverModal').modal('toggle');
}

$('#newtype').change(function(){
  functionmodal();
});

$('#newcontent').click(function(){
  functionmodal();
});
