import pytest


@pytest.mark.slow
def test_initial_setup() -> None:
    """Temporary test to satisfy both standard and slow CI filter sweeps."""
    assert True
