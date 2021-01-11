--------------------------------------------------------------------------------------------
<a name="{{ cell_name.replace('_','-')}}"></a>
### `{{ cell_name }}`

Description: {{ description }}

Height: {{ height }}
<br>
Width: {{ width }}

| Port Number          | Label                | Layer                | Attributes           |
|----------------------|----------------------|----------------------|----------------------|
{% for row in table_rows %}
{{ row }}
{% endfor %}

