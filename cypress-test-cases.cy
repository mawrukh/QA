describe('Registration Form Positive Scenarios', () => {
  beforeEach(() => {
    cy.visit('/register')
  })

  it('TC001: Successful registration with all fields filled', () => {
    cy.get('#fullName').type('Emily Johnson')
    cy.get('#email').type('emily.j@email.com')
    cy.get('#password').type('P@ssw0rd123')
    cy.get('#confirmPassword').type('P@ssw0rd123')
    cy.get('#dateOfBirth').type('1990-05-15')
    cy.get('#gender').select('Female')
    cy.get('#newsletter').check()
    
    cy.get('form').submit()

    cy.url().should('include', '/confirmation')
    cy.contains('Registration Successful').should('be.visible')
    cy.contains('Emily Johnson').should('be.visible')
    cy.contains('emily.j@email.com').should('be.visible')
  })

  it('TC002: Successful registration with minimum required fields', () => {
    cy.get('#fullName').type('Michael Chang')
    cy.get('#email').type('mchang@company.net')
    cy.get('#password').type('SecureLogin!9')
    cy.get('#confirmPassword').type('SecureLogin!9')
    cy.get('#dateOfBirth').type('1985-12-03')
    cy.get('#gender').select('Male')
    // Not checking newsletter subscription
    
    cy.get('form').submit()

    cy.url().should('include', '/confirmation')
    cy.contains('Registration Successful').should('be.visible')
    cy.contains('Michael Chang').should('be.visible')
    cy.contains('mchang@company.net').should('be.visible')
  })

  it('TC003: Successful registration with different gender option', () => {
    cy.get('#fullName').type('Alex Morgan')
    cy.get('#email').type('alex.m@university.edu')
    cy.get('#password').type('StrongPwd#2024')
    cy.get('#confirmPassword').type('StrongPwd#2024')
    cy.get('#dateOfBirth').type('1998-08-22')
    cy.get('#gender').select('Other')
    cy.get('#newsletter').check()
    
    cy.get('form').submit()

    cy.url().should('include', '/confirmation')
    cy.contains('Registration Successful').should('be.visible')
    cy.contains('Alex Morgan').should('be.visible')
    cy.contains('alex.m@university.edu').should('be.visible')
  })
})
