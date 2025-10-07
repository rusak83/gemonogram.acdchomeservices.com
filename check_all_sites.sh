#!/bin/bash

sites=(
    "https://subzero.acdchomeservices.com"
    "https://viking.acdchomeservices.com"
    "https://wolf.acdchomeservices.com"
    "https://thermador.acdchomeservices.com"
    "https://kitchenaid.acdchomeservices.com"
    "https://icemachines.acdchomeservices.com"
    "https://gemonogram.acdchomeservices.com"
    "https://jennair.acdchomeservices.com"
    "https://liebherr.acdchomeservices.com"
    "https://winecoolers.acdchomeservices.com"
)

echo "🌐 ПРОВЕРКА СТАТУСА ВСЕХ САЙТОВ"
echo "==============================="
echo ""

for site in "${sites[@]}"; do
    echo "🔍 Проверяем: $site"
    
    # Проверяем HTTP статус
    status=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "$site" 2>/dev/null || echo "ERROR")
    
    if [[ "$status" == "200" ]]; then
        echo "✅ РАБОТАЕТ ($status)"
    elif [[ "$status" == "404" ]]; then
        echo "❌ НЕ НАЙДЕН (404)"
    elif [[ "$status" == "ERROR" ]]; then
        echo "❌ ОШИБКА СОЕДИНЕНИЯ"
    else
        echo "⚠️  СТАТУС: $status"
    fi
    
    echo ""
done

echo "🎯 РЕКОМЕНДАЦИИ:"
echo "==============="
echo "1. Для сайтов с ошибками проверьте DNS настройки"
echo "2. Добавьте CNAME записи: subdomain -> rusak83.github.io"
echo "3. Подождите 10-15 минут после изменения DNS"
echo "4. Проверьте настройки GitHub Pages в репозиториях"
