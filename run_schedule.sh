#!/bin/bash
/usr/bin/docker exec agr-php php artisan schedule:run >> /dev/null 2>&1