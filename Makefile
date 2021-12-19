help:
	@echo '---------- 環境構築に関するコマンド -----------'
	@echo 'init           -- プロジェクト初期のセットアップを行います※基本的にクローンしてきて1回目のみ実行'

init:
	@make setup

setup:
	$(shell ./setup.sh)
