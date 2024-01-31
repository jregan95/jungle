
describe('example to-do app', () => {
  it('successfully loads', () => {
    cy.visit('http://localhost:3000') 
  })

  it('checks if cart is empty', () => {
    cy.contains('My Cart (0)');
  });

  it('clicks product view and then adds item to cart', () => {
    cy.get(".products article").first().should("exist").click({ multiple: true });
    cy.get('[data-testid="add-to-cart-button"]').first().scrollIntoView().click();
  });

  it('adds item to cart', () => {
    cy.contains('My Cart (1)');
  });
  
  });



