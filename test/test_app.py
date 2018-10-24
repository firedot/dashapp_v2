# test_app.py

import sys, os
import dash
import pytest
import app

def test_app():
    dash_test=app.app.layout
    assert 'Dash' in str(dash_test)
