# test_app.py

import sys
sys.path.append('/home/travis/virtualenv/python3.5.6/lib/python3.5/site-packages/')
import pytest
import app

def test_app():
    dash_test=app.app.layout
    assert 'Dash' in str(dash_test)
