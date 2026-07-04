import { prisma } from '../config/database';

async function main() {
  const name = 'gà 12D';
  console.log(`Searching for products with name/SKU containing "${name}"...`);
  
  const products = await prisma.product.findMany({
    where: {
      OR: [
        { name: { contains: name, mode: 'insensitive' } },
        { sku: { contains: name, mode: 'insensitive' } }
      ]
    },
    include: {
      category: true
    }
  });

  console.log(`Found ${products.length} products:`);
  products.forEach(p => {
    console.log(`- ID: ${p.id}, SKU: ${p.sku}, Name: "${p.name}", Price: ${p.sellPrice}, isActive: ${p.isActive}, Category: ${p.category?.name}`);
  });
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect());
