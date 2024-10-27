from dotenv import load_dotenv
from xkcd.settings import OS, DISTRO

load_dotenv()


class TestSettings:
    def test_os(self):
        assert OS == "Darwin"

    def test_distro(self):
        assert DISTRO == "Mac"
