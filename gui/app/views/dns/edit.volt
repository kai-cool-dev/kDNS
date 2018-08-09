<div class="row">
  <div class="col-lg-12">
    {{ content() }}
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    <h1>Edit {{ domain.name }}</h1>
    <hr>
  </div>
</div>

{% for record in records %}
  {% if loop.first %}
  <table class="table table-striped">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">Name</th>
        <th scope="col">Type</th>
        <th scope="col">Content</th>
        <th scope="col" colspan="2">TTL / Prio</th>
        <th scope="col" colspan="2"></th>
      </tr>
    </thead>
    <tbody>
  {% endif %}
    {% if record.disabled == 1 %}
      <tr class="bg-warning">
    {% else %}
      <tr>
    {% endif %}
        <th scope="row">#{{ record.id }}</th>
        <td><div class="input-group">{{ form.render('name') }}</div></td>
        <td>{{ record.type }}</td>
        <td>{{ record.content }}</td>
        <td>{{ record.ttl }}</td>
        <td>
          {% if record.disabled == 0 %}
          <button type="submit" class="btn form-control btn-secondary">Disable</button>
          {% else %}
          <button type="submit" class="btn form-control btn-success">Enable</button>
          {% endif %}
        </td>
        <td><button type="submit" class="btn form-control btn-success">Save</button></td>
      </tr>
  {% if loop.last %}
    </tbody>
  </table>
  {% endif %}
{% else %}
  <form method="post">
    {{ form.render('type') }}
    {{ form.render('action') }}
    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">No SOA Record. We create one!</h5>
            <p class="card-text">The SOA Record is essential and stores the E-Mail-Address from the Zone-Owner (which is shown in whois), the first nameserver and some extra settings.</p>
            <p class="card-text">You can change everything later too.</p>
            <div class="row">
              <div class="col-lg-12">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">E-Mail</span>
                  </div>
                  {{ form.render('email') }}
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-12">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">Primary Nameserver</span>
                  </div>
                  {{ form.render('nameserver') }}
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-12">
                <hr>
                <h5 class="card-title">Nameserver Settings</h5>
                <p class="card-text">All Values in Seconds</p>
              </div>
              <div class="col-lg-3">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">Refresh</span>
                  </div>
                  {{ form.render('refresh') }}
                </div>
              </div>
              <div class="col-lg-3">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">Retry</span>
                  </div>
                  {{ form.render('retry') }}
                </div>
              </div>
              <div class="col-lg-3">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">Expire</span>
                  </div>
                  {{ form.render('expire') }}
                </div>
              </div>
              <div class="col-lg-3">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">TTL</span>
                  </div>
                  {{ form.render('ttl') }}
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-12">
                <button type="submit" class="form-control btn btn-primary">Create SOA</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>
{% endfor %}
