<div class="row">
  <div class="col-lg-12">
    {{ content() }}
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    <h1>Delete Domain "{{ domain.name }}"</h1>
    <hr>
    <p>Do you want to delete the domain?</p>
  </div>
</div>

<div class="row">
  <div class="col-lg-6">
    {{ link_to('dns/edit/' ~ domain.id, '<i class="fas fa-angle-left"></i> Back', 'class':'form-control btn btn-primary') }}
  </div>
  <div class="col-lg-6">
    <form method="post">
      <button type="submit" class="form-control btn btn-danger"><i class="fas fa-trash"></i> Delete</button>
    </form>
  </div>
</div>
