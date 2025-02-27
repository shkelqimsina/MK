/* eslint-disable import/no-extraneous-dependencies */
import react from '@vitejs/plugin-react';
import { resolve } from 'path';
import { defineConfig } from 'vite';
import eslint from 'vite-plugin-eslint';
import StylelintWebpackPlugin from 'stylelint-webpack-plugin';

export default defineConfig({
  plugins: [
    react(),
    eslint({ failOnWarning: false, failOnError: false, cache: false }),
    new StylelintWebpackPlugin({ files: '**/*.less' }),
  ],
  server: {
    port: 3000,
    cors: true,
    proxy: {
      '^/(api)|(media)|(static)/': {
        target: 'http://api:8000',
        changeOrigin: true,
      },
    },
  },
  esbuild: {
    loader: 'jsx',
  },
  optimizeDeps: {
    esbuildOptions: {
      loader: {
        '.js': 'jsx',
      },
    },
  },
  resolve: {
    alias: { '@': resolve(__dirname, './src') },
  },
  build: {
    assetsDir: 'static',
  },
});
