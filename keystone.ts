import { config } from '@keystone-next/keystone/schema';
import { statelessSessions } from '@keystone-next/keystone/session';

import { lists } from './schema';
import { withAuth, sessionSecret } from './auth';

let sessionMaxAge = 60 * 60 * 24 * 30; // 30 days

const session = statelessSessions({
  maxAge: sessionMaxAge,
  secret: sessionSecret!,
});

function getDbUrl(){
  let POSTGRES_USER = process.env.POSTGRES_USER || "postgres"
  let POSTGRES_HOST = process.env.POSTGRES_HOST || "localhost"
  let POSTGRES_PORT= process.env.POSTGRES_PORT || 5432
  let POSTGRES_PASS = process.env.POSTGRES_PASS || "gopher"
  return `postgres://${POSTGRES_USER}:${POSTGRES_PASS}@${POSTGRES_HOST}:${POSTGRES_PORT}/keystone`
}

export default withAuth(
  config({
    db: {
      provider: 'postgresql',
      url: getDbUrl(),
      enableLogging: true,
      useMigrations: true
    },
    ui: {
      isAccessAllowed: (context) => !!context.session?.data,
    },
    lists,
    session,
    images: {
      upload: "local",
      local: {
        storagePath: "images",
        baseUrl: "/images"
      }
    },
    server: {
      port: 8000,
      cors: { origin: ["http://localhost:3000"]}
    }
  })
);
