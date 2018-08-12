<div class="row">
  <div class="col-lg-12">
    <h1>Edit {{ domain.name }}</h1>
    <hr>
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    {{ content() }}
  </div>
</div>

<form method="post" action="{{ url('dns/edit/' ~ domain.id) }}">
  <input type="hidden" name="id" value="{{ domain.id }}">
  <div class="row">
    <div class="col-lg-12">
      {{ descriptionform.render('description') }}
    </div>
  </div>

<div class="row">
  <div class="col-lg-6">
    <button type="submit" name="action" value="updateDescription" class="btn form-control btn-success" data-toggle="tooltip" data-placement="bottom" title="Save"><i class="fas fa-save"></i> Save Description</button>
  </div>
</form>
  <div class="col-lg-6">
    {{ link_to('dns/delete/' ~ domain.id,'<i class="fas fa-trash"></i> Delete Domain','class':'btn btn-danger form-control') }}
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
        <th scope="col" colspan="3"></th>
      </tr>
    </thead>
    <tbody>
  {% endif %}
    {% if record.disabled == 1 %}
      <tr class="bg-disabled">
    {% else %}
      <tr>
    {% endif %}
        <form method="post" action="{{ url('dns/edit/' ~ domain.id) }}">
          <input type="hidden" name="id" value="{{ record.id }}" />
          <th scope="row">#{{ record.id }}</th>
          <td><div class="input-group">{{ form[record.id].render('name',[ 'id' : 'ttl'+record.id]) }}</div></td>
          <td><div class="input-group">{{ form[record.id].render('type',[ 'id' : 'ttl'+record.id]) }}</div></td>
          <td><div class="input-group">{{ form[record.id].render('content',[ 'id' : 'ttl'+record.id]) }}</div></td>
          {% if record.type == "MX" %}
            <td><div class="input-group">{{ form[record.id].render('ttl',[ 'id' : 'ttl'+record.id]) }}</div></td>
            <td><div class="input-group">{{ form[record.id].render('prio',[ 'id' : 'prio'+record.id]) }}</div></td>
          {% else %}
            <td colspan="2"><div class="input-group">{{ form[record.id].render('ttl',[ 'id' : 'ttl'+record.id]) }}</div></td>
          {% endif %}
          <td><button type="submit" name="action" value="update" class="btn form-control btn-success" data-toggle="tooltip" data-placement="bottom" title="Save"><i class="fas fa-save"></i></button></td>
          <td>
            {% if record.type != "SOA" %}
              {% if record.disabled == 0 %}
              <button type="submit" class="btn form-control btn-secondary" name="action" value="disable" data-toggle="tooltip" data-placement="bottom" title="Disable"><i class="fas fa-ban"></i></button>
              {% else %}
              <button type="submit" class="btn form-control btn-primary" name="action" value="enable" data-toggle="tooltip" data-placement="bottom" title="Enable"><i class="fas fa-play"></i></button>
              {% endif %}
            {% endif %}
          </td>
          <td><button type="submit" class="btn form-control btn-danger" name="action" value="delete" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash"></i></button></td>
        </form>
      </tr>
  {% if loop.last %}
      <tr>
        <form method="post" action="{{ url('dns/edit/' ~ domain.id) }}">
          {{ newform.render('action') }}
          {{ newform.render('prio',[ 'id' : 'newprio']) }}
          <th scope="row">NEW</th>
          <td><div class="input-group">
            {{ newform.render('name') }}
            <div class="input-group-append">
              <span class="input-group-text" id="basic-addon2">.{{ domain.name }}</span>
            </div>
          </div></td>
          <td><div class="input-group">{{ newform.render('type',[ 'id' : 'newtype']) }}</div></td>
          <td><div class="input-group">{{ newform.render('content',[ 'id' : 'newcontent']) }}</div></td>
          <td colspan="2"><div class="input-group">{{ newform.render('ttl',[ 'id' : 'newttl']) }}</div></td>
          <td colspan="3"><button type="submit" class="btn form-control btn-success" name="action" value="create"><i class="fas fa-plus"></i> Create</button></td>
        </form>
      </tr>
    </tbody>
  </table>
  {% endif %}
{% else %}
  <form method="post" action="{{ url('dns/edit/' ~ domain.id) }}">
    {{ form.render('type') }}
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
                    <span class="input-group-text">E-Mail</span>
                  </div>
                  {{ form.render('email') }}
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-12">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">Primary Nameserver</span>
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
                    <span class="input-group-text">Refresh</span>
                  </div>
                  {{ form.render('refresh') }}
                </div>
              </div>
              <div class="col-lg-3">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">Retry</span>
                  </div>
                  {{ form.render('retry') }}
                </div>
              </div>
              <div class="col-lg-3">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">Expire</span>
                  </div>
                  {{ form.render('expire') }}
                </div>
              </div>
              <div class="col-lg-3">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">TTL</span>
                  </div>
                  {{ form.render('ttl') }}
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-12">
                <button type="submit" class="form-control btn btn-primary" name="action" value="createSOA">Create SOA</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>
{% endfor %}


<!-- Modal for Nameserver selection -->
<div class="modal fade" tabindex="-1" role="dialog" id="nameserverModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Please select the Nameserver</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Please select the nameserver for which you want to insert the nameserver record.</p>
        {{ nameserverform.render('nameserver') }}
        <p>Please don't forget to Create the Record after selecting the nameserver.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-success" onclick="nameserversave()">Select</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal for MX Record -->
<div class="modal fade" tabindex="-1" role="dialog" id="mxserverModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Please type in your mailserver</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Please type in your remote mailserver</p>
        {{ mxserverform.render('mailserver') }}
        <p>Please type in the priority (you can leave that as standard)</p>
        {{ mxserverform.render('prio',[ 'id' : 'mxprio']) }}
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-success" onclick="mxserversave()">Save</button>
      </div>
    </div>
  </div>
</div>
