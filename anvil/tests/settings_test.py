from dotenv import load_dotenv
from anvil.settings import OS, DISTRO

load_dotenv()


class TestSettings:
    def test_os(self):
        assert OS == "Darwin" or OS == "Linux"

    def test_distro(self):
        if OS == "Darwin":
            assert DISTRO == "Mac"
