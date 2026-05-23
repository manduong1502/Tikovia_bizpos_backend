class SimpleCache {
  private cache = new Map<string, { value: any; expiry: number }>();

  tenantKey(tenantId: number, key: string): string {
    return `tenant:${tenantId}:${key}`;
  }

  set(key: string, value: any, ttlSeconds: number = 300) {
    const expiry = Date.now() + ttlSeconds * 1000;
    this.cache.set(key, { value, expiry });
  }

  get(key: string): any | null {
    const entry = this.cache.get(key);
    if (!entry) return null;
    if (Date.now() > entry.expiry) {
      this.cache.delete(key);
      return null;
    }
    return entry.value;
  }

  delete(key: string) {
    this.cache.delete(key);
  }

  clearPattern(pattern: string) {
    for (const key of this.cache.keys()) {
      if (key.includes(pattern)) {
        this.cache.delete(key);
      }
    }
  }

  clear() {
    this.cache.clear();
  }
}

export const memoryCache = new SimpleCache();

