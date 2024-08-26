.PHONY: build up down logs shell tree

build:  ## ビルド
	docker-compose build

up:  ## 起動
	docker-compose up -d

down:  ## 停止
	docker-compose down

logs:  ## ログ表示
	docker-compose logs -f

shell:  ## コンテナ内でシェル実行
	docker-compose exec web bash

tree:  ## プロジェクトのディレクトリ構造を表示 (venvなどを除外)
	tree -I 'venv|__pycache__' .