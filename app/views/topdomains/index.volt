<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <h1><i class="fas fa-dot-circle"></i> List Top Level Domains</h1>
            <hr>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            {{ content() }}
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <p>{{ link_to('topdomains/create','<i class="fas fa-plus"></i> Create','class':'btn btn-success form-control','data-toggle': 'tooltip', 'data-placement': 'bottom', 'title': 'Create new top level domain') }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        {% for topdomain in topdomains.items %}
          {% if loop.first %}
          <div class="row">
            <div class="col-lg-12">
              <table class="table table-striped table-borderless">
                <thead>
                  <th scope="col">Name</th>
                  <th scope="col">Description</th>
                  <th scope="col"></th>
                </thead>
                <tbody>
          {% endif %}
                <tr>
                  <th>{{ topdomain.name }}</th>
                  <td>{{ topdomain.description }}</td>
                  <td>{{ link_to('topdomains/edit/' ~ topdomain.id ~ '/','<i class="fas fa-info-circle"></i> Details','class':'btn btn-primary form-control','data-toggle': 'tooltip', 'data-placement': 'bottom', 'title': 'Show Top Level Domain details') }}</td>
                </tr>
          {% if loop.last %}
                </tbody>
              </table>
            </div>
          </div>
          {% endif %}
        {% endfor %}
        {% if topdomains.next  > 1 %}
          <div class="row">
            <div class="col-lg-2">
              {{ form('topdomains/index') }}
                <button type="submit" class="btn btn-primary form-control"><i class="fas fa-angle-double-left"></i> First</button>
              </form>
            </div>
            <div class="col-lg-2">
              {{ form('topdomains/index') }}
                <input type="hidden" name="page" value="{{ topdomains.before }}">
                <button type="submit" class="btn btn-primary form-control"><i class="fas fa-angle-left"></i> Previous</button>
              </form>
            </div>
            <div class="col-lg-4">
              <p class="form-control">{{ topdomains.current }}/{{ topdomains.total_pages }}</p>
            </div>
            <div class="col-lg-2">
              {{ form('topdomains/index') }}
                <input type="hidden" name="page" value="{{ topdomains.next }}">
                <button type="submit" class="btn btn-primary form-control">Next <i class="fas fa-angle-right"></i></button>
              </form>
            </div>
            <div class="col-lg-2">
              {{ form('topdomains/index') }}
                <input type="hidden" name="page" value="{{ topdomains.last }}">
                <button type="submit" class="btn btn-primary form-control">Last <i class="fas fa-angle-double-right"></i></button>
              </form>
            </div>
          </div>
        {% endif %}
      </div>
    </div>
  </div>
</div>
