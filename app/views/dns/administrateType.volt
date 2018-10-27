<div class="row">
  <div class="col-lg-12">
    <h1><i class="fas fa-server"></i> Manage Record Types</h1>
    <hr>
    <p>These are the settings for your PowerDNS Server</p>
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    {{ content() }}
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    {% for type in types %}
      {% if loop.first %}
      <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <form method="post">
              <th scope="row">NEW</th>
              <td><div class="input-group">{{ form.render('value') }}</div></td>
              <td><button type="submit" class="btn form-control btn-success" name="action" value="create" data-toggle="tooltip" data-placement="bottom" title="Create"><i class="fas fa-plus"></i> </button></td>
            </form>
          </tr>
      {% endif %}
          <tr>
            <form method="post">
              <input type="hidden" name="id" value="{{ type.id }}" />
              <th scope="row">#{{ type.id }}</th>
              <td><p class="form-control">{{ type.value }}</p></td>
              <td><button type="submit" class="btn form-control btn-danger" name="action" value="delete" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash"></i></button></td>
            </form>
          </tr>
      {% if loop.last %}
        </tbody>
      </table>
      {% endif %}
    {% else %}
      <h2>Add your first Record Type.</h2>
      <table class="table table-striped">
        <tr>
          <form method="post">
            <th scope="row">NEW</th>
            <td><div class="input-group">{{ form.render('value') }}</div></td>
            <td><button type="submit" class="btn form-control btn-success" name="action" value="create" data-toggle="tooltip" data-placement="bottom" title="Create"><i class="fas fa-plus"></i> </button></td>
          </form>
        </tr>
      </table>
    {% endfor %}
  </div>
</div>
