<div class="row">
  <div class="col-lg-12">
    <h1><i class="fas fa-server"></i> Administrate Recursor Zones</h1>
    <hr>
    <p>Here you can add the recursor zone. All the Domains in your own nameservers are automatically exported and not listed here!</p>
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    {{ content() }}
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    {% for recursor in recursors %}
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
              <td><div class="input-group">{{ form.render('zone') }}</div></td>
              <td><div class="input-group">{{ form.render('ip') }}</div></td>
              <td><div class="input-group">{{ form.render('description') }}</div></td>
              <td><button type="submit" class="btn form-control btn-success" name="action" value="create" data-toggle="tooltip" data-placement="bottom" title="Create"><i class="fas fa-plus"></i> </button></td>
            </form>
          </tr>
      {% endif %}
          <tr>
            <form method="post">
              <input type="hidden" name="id" value="{{ recursor.id }}" />
              <th scope="row">#{{ recursor.id }}</th>
              <td><p class="form-control">{{ recursor.zone }}</p></td>
              <td><p class="form-control">{{ recursor.ip }}</p></td>
              <td><p class="form-control">{{ recursor.description }}</p></td>
              <td><button type="submit" class="btn form-control btn-danger" name="action" value="delete" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash"></i></button></td>
            </form>
          </tr>
      {% if loop.last %}
        </tbody>
      </table>
      {% endif %}
    {% else %}
      <h2>Add your first Top Level Domain.</h2>
      <table class="table table-striped">
        <tr>
          <form method="post">
            <th scope="row">NEW</th>
            <td><div class="input-group">{{ form.render('zone') }}</div></td>
            <td><div class="input-group">{{ form.render('ip') }}</div></td>
            <td><div class="input-group">{{ form.render('description') }}</div></td>
            <td><button type="submit" class="btn form-control btn-success" name="action" value="create" data-toggle="tooltip" data-placement="bottom" title="Create"><i class="fas fa-plus"></i> </button></td>
          </form>
        </tr>
      </table>
    {% endfor %}
  </div>
</div>
