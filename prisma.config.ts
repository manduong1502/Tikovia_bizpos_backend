import { defineConfig } from '@prisma/config';

export default defineConfig({
  schema: {
    options: {
      datasource: {
        url: process.env.DATABASE_URL,
      },
    },
  },
});
