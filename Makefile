.PHONY: build up down logs web db config tree clean-build

build:  ## ビルド
	docker-compose build

up:  ## 起動
	docker-compose up -d

down:  ## 停止
	docker-compose down

logs:  ## ログ表示
	docker-compose logs -f

web:  ## webコンテナ内でシェル実行
	docker-compose exec web bash

db:  ## dbコンテナ内でシェル実行
	docker-compose exec db bash

config:  ## Docker Composeの設定を表示
	docker-compose config

tree:  ## プロジェクトのディレクトリ構造を表示 (venvなどを除外)
	tree -I 'venv|__pycache__|mysql-data' .

clean-build:  ## キャッシュを使用せずにクリーンビルド
	docker-compose down -v
	docker system prune -af
	docker volume prune -f
	docker-compose build --no-cache
	docker-compose up -d

help:  ## このヘルプを表示
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help