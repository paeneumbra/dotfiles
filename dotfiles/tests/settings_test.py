from dotenv import load_dotenv
from dotfiles.settings import OS

load_dotenv()


class TestSettings:
    def test_os(self):
        assert OS == "Darwin" or OS == "Linux"

    # def test_distro(self):
    #     if OS == "Darwin":
    #         assert DISTRO == "Mac"
