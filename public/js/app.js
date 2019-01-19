function display_search()
{
  $('#searchform').toggle();
}

function edit_modal(record_id)
{
  console.log("Collect Information");
  var name = $('#name_'+record_id).val();
  var type = $('#type_'+record_id).val();
  var content = $('#content_'+record_id).val();
  var prio = $('#prio_'+record_id).val();
  var ttl = $('#ttl_'+record_id).val();
  var domain = $('#domain_'+record_id).val();
  console.log("Information collected. Name: "+name+", Type: "+type+", Content: "+content+", TTL: "+ttl+", Prio: "+prio);
  console.log("Write information into modal.")
  $('#edit_modal_record_id').val(record_id);
  var rec_name=name.replace(domain,"");
  $('#edit_modal_name').val(rec_name.replace(".",""));
  $('#edit_modal_content').val(content);
  console.log("Display Modal.")
  $('#edit_modal').modal('toggle');
}

function ttl_modal(record_id)
{
  console.log("Collect Information");
  var name = $('#name_'+record_id).val();
  var type = $('#type_'+record_id).val();
  var content = $('#content_'+record_id).val();
  var prio = $('#prio_'+record_id).val();
  var ttl = $('#ttl_'+record_id).val();
  console.log("Information collected. Name: "+name+", Type: "+type+", Content: "+content+", TTL: "+ttl+", Prio: "+prio);
  console.log("Write information into modal.")
  $('#ttl_modal_record_id').val(record_id);
  $('#ttl_modal_ttl').val(ttl);
  $('#ttl_modal_prio').val(prio);
  console.log("Display Modal.")
  $('#ttl_modal').modal('toggle');
}

$('.alert').click(function(){
  $('.alert').toggle();
});

$(function () {
  $('[data-toggle="tooltip"]').tooltip();
})
