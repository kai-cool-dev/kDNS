<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            {% if name %}
              <h1><i class="fas fa-search"></i> Search for "{{ name }}"</h1>
            {% else %}
              <h1><i class="fas fa-columns"></i> Domain Overview</h1>
            {% endif %}
            <hr>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6">
            <a class="btn btn-primary form-control" onclick="display_search()"><i class="fas fa-search"></i> Search for Domain</a>
          </div>
          <div class="col-lg-6">
            {{ link_to("domain/create", '<i class="fas fa-plus"></i> Create new Domain', "class": "btn btn-success form-control") }}
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            {{ content() }}
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
        {{ form('domain/','class': 'form-search', 'id': 'searchform') }}
          <div class="row">
            <div class="col-lg-10">
              {{ form.render('name') }}
            </div>
            <div class="col-lg-2">
              <button class="form-control btn btn-success"><i class="fas fa-search"></i> Search</button>
            </div>
          </div>
        </form>
        <div class="row">
          <div class="col-lg-12">
            {% for domain in domains.items %}
              {% if loop.first %}
              <table class="table table-striped table-borderless">
                <tbody>
              {% endif %}
              <tr>
                <th scope="row">{{ link_to('domain/edit/' ~ domain.id,domain.name) }}</th>
                <td>{{ domain.description }}</td>
                <td>{{ link_to('domain/edit/' ~ domain.id,'<i class="fas fa-info-circle"></i> Details','class':'btn btn-primary form-control') }}</td>
              </tr>
              {% if loop.last %}
                </tbody>
                  </table>
              {% endif %}
              {% else %}
                {% if name %}
                  <p>Search result didn't returned any results.</p>
                {% else %}
                  <p>You don't have any domains.</p>
                {% endif %}
            {% endfor %}
          </div>
        </div>
        {% if domains.next  > 1 %}
          <div class="row">
            <div class="col-lg-2">
              {{ form('domain/') }}
                <input type="hidden" name="name" value="{{ name }}">
                <button type="submit" class="btn btn-primary form-control"><i class="fas fa-angle-double-left"></i> First</button>
              </form>
            </div>
            <div class="col-lg-2">
              {{ form('domain/') }}
                <input type="hidden" name="name" value="{{ name }}">
                <input type="hidden" name="page" value="{{ domains.before }}">
                <button type="submit" class="btn btn-primary form-control"><i class="fas fa-angle-left"></i> Previous</button>
              </form>
            </div>
            <div class="col-lg-4">
              <p class="form-control">{{ domains.current }}/{{ domains.total_pages }}</p>
            </div>
            <div class="col-lg-2">
              {{ form('domain/') }}
                <input type="hidden" name="name" value="{{ name }}">
                <input type="hidden" name="page" value="{{ domains.next }}">
                <button type="submit" class="btn btn-primary form-control">Next <i class="fas fa-angle-right"></i></button>
              </form>
            </div>
            <div class="col-lg-2">
              {{ form('domain/') }}
                <input type="hidden" name="name" value="{{ name }}">
                <input type="hidden" name="page" value="{{ domains.last }}">
                <button type="submit" class="btn btn-primary form-control">Last <i class="fas fa-angle-double-right"></i></button>
              </form>
            </div>
          </div>
        {% endif %}
      </div>
    </div>
  </div>
</div>
