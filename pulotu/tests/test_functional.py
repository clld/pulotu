def test_home(app):
    app.get_html('/', status=200)
    app.get_html('/about', status=200)
    app.get_html('/glossary', status=200)
