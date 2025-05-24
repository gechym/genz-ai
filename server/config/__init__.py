from dotenv import load_dotenv
from pydantic_settings import BaseSettings

load_dotenv()


class Settings(BaseSettings):
    """Settings class to load environment variables."""

    _env_file: str = ".env"
    _env_file_encoding: str = "utf-8"

    def __init__(self, _env_file: str = ".env", _env_file_encoding: str = "utf-8"):
        super().__init__(_env_file=_env_file, _env_file_encoding=_env_file_encoding)

    class Config:
        extra = "ignore"


settings = Settings(_env_file=".env", _env_file_encoding="utf-8")


__all__ = ["settings"]
