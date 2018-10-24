# test_app.py

import sys, os
sys.path.append('/usr/lib/python3.5/site-packages')
import pytest
import app

def test_app():
    dash_test=app.app.layout
    assert 'Dash' in str(dash_test)
