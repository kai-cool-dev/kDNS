<div class="row">
  <div class="col-lg-3">
    {{ link_to('dns/administrateNS','<i class="fas fa-wrench"></i> Edit authorative Nameserver', 'class': 'btn btn-primary form-control') }}
  </div>
  <div class="col-lg-3">
    {{ link_to('dns/administrateRecursor','<i class="fas fa-wrench"></i> Edit recursor Nameserver', 'class': 'btn btn-primary form-control') }}
  </div>
  <div class="col-lg-3">
    {{ link_to('dns/administrateType','<i class="fas fa-wrench"></i> Edit Record Types', 'class': 'btn btn-primary form-control') }}
  </div>
  <div class="col-lg-3">
    {{ link_to('dns/administrateTLD','<i class="fas fa-wrench"></i> Edit Top Level Domains', 'class': 'btn btn-primary form-control') }}
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    <h1><i class="fas fa-server"></i> Administrate Top Level Domains</h1>
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
    {% for tld in tlds %}
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
              <input type="hidden" name="id" value="{{ tld.id }}" />
              <th scope="row">#{{ tld.id }}</th>
              <td>{{ tld.value }}</td>
              <td><button type="submit" class="btn form-control btn-danger" name="action" value="delete" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash"></i></button></td>
            </form>
          </tr>
      {% if loop.last %}
        </tbody>
      </table>
      {% endif %}
    {% else %}
      <h2>Add your first Top Level Domain.</h2>
      <p>Currently you don't have any nameservers. Just at least two.</p>
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
