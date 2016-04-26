<div class="copyright" >
  {% set current = date(Date.now(), "YYYY") %}
  &copy; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="fa fa-heart"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ config.author }}</span>
</div>

<div class="powered-by">
  {{ __('footer.powered', '<a class="theme-link" href="http://hexo.io">Hexo</a>') }}
</div>

<div class="theme-info">
  {{ __('footer.theme') }} -
  <a class="theme-link" href="https://github.com/iissnan/hexo-theme-next">
    NexT.{{ theme.scheme }}
  </a>
</div>
<link href="{{ url_for(theme.css) }}/important.css?v={{ theme.version }}" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.useso.com/js/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="{{ url_for(theme.js) }}/important.js?v={{ theme.version }}"></script>

{% block footer %}{% endblock %}
