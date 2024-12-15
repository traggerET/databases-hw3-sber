```sh
psql -U postgres -d mydb -f init.sql
pgbench -U postgres -j 6 -c 5 -t 2000000 -f load.sql mydb
```

Считаем cache hit ratio

```sql
SELECT sum(heap_blks_hit) / (sum(heap_blks_hit) + sum(heap_blks_read))::float as ratio
FROM pg_statio_user_tables;
```

Результаты

block_size = 8KB, shared_buffers = 128MB, TPS = 11542, cache ratio = 0.987353499791989
block_size = 16KB, shared_buffers = 128MB, TPS = 11234, cache ratio = 0.985405234053221
block_size = 8KB, shared_buffers = 256MB, TPS = 12351, cache ratio = 0.992414505656321
block_size = 16KB, shared_buffers = 256MB, TPS = 11912, cache ratio = 0.990436535423219
