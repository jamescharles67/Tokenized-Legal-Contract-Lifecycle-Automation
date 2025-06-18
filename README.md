# Tokenized Legal Contract Lifecycle Automation

A comprehensive smart contract system built on Stacks blockchain using Clarity for automating legal contract lifecycle management with tokenization features.

## Overview

This system provides end-to-end automation for legal contract management, from creation to renewal, with built-in compliance monitoring and amendment tracking. Each contract is tokenized for better ownership management and transfer capabilities.

## Features

### 🏢 Legal Firm Verification
- Verify and register legal service firms
- Maintain firm credentials and licensing information
- Rating system for firm reputation
- Active/inactive status management

### 📄 Contract Creation
- Automated contract creation with tokenization
- Multi-party contract support
- Contract type categorization
- Value tracking and management

### 📝 Amendment Tracking
- Complete amendment history
- Approval workflow for amendments
- Amendment type categorization
- Detailed change descriptions

### 🔍 Compliance Monitoring
- Automated compliance checks
- Violation tracking and severity levels
- Compliance statistics and reporting
- Historical compliance data

### 🔄 Renewal Automation
- Automatic renewal notifications
- Configurable renewal periods
- Auto-renewal settings
- Renewal terms management

## Smart Contracts

### 1. Legal Firm Registry (`legal-firm-registry.clar`)
Manages verification and registration of legal service firms.

**Key Functions:**
- `register-firm`: Register a new legal firm
- `deactivate-firm`: Deactivate a firm
- `rate-firm`: Rate a firm's services
- `is-verified-firm`: Check if a firm is verified

### 2. Contract Creation (`contract-creation.clar`)
Handles the creation and management of legal contracts.

**Key Functions:**
- `create-contract`: Create a new tokenized contract
- `update-contract-status`: Update contract status
- `get-contract`: Retrieve contract information

### 3. Amendment Tracking (`amendment-tracking.clar`)
Tracks all amendments made to contracts.

**Key Functions:**
- `create-amendment`: Create a new amendment
- `approve-amendment`: Approve pending amendments
- `get-contract-amendments`: Get amendment history

### 4. Compliance Monitoring (`compliance-monitoring.clar`)
Monitors contract compliance and tracks violations.

**Key Functions:**
- `perform-compliance-check`: Perform compliance verification
- `get-compliance-stats`: Get compliance statistics
- `get-contract-compliance-history`: Get compliance history

### 5. Renewal Automation (`renewal-automation.clar`)
Automates contract renewal processes.

**Key Functions:**
- `set-auto-renewal`: Configure auto-renewal settings
- `renew-contract`: Renew an existing contract
- `create-renewal-notification`: Create renewal notifications

## Getting Started

### Prerequisites
- Stacks blockchain node
- Clarity CLI tools
- Node.js and npm (for testing)

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd legal-contract-automation
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

### Deployment

Deploy contracts to Stacks blockchain:

\`\`\`bash
# Deploy legal firm registry first
clarinet deploy legal-firm-registry

# Deploy other contracts
clarinet deploy contract-creation
clarinet deploy amendment-tracking
clarinet deploy compliance-monitoring
clarinet deploy renewal-automation
\`\`\`

## Usage Examples

### Register a Legal Firm
\`\`\`clarity
(contract-call? .legal-firm-registry register-firm
'SP1HTBVD3JG9C05J7HBJTHGR0GGW7KX17ECNWWALK
"Smith & Associates"
"LAW-2024-001"
)
\`\`\`

### Create a Contract
\`\`\`clarity
(contract-call? .contract-creation create-contract
(list 'SP1HTBVD3JG9C05J7HBJTHGR0GGW7KX17ECNWWALK 'SP2HTBVD3JG9C05J7HBJTHGR0GGW7KX17ECNWWALK)
0x1234567890abcdef
"Service Agreement"
u100000
)
\`\`\`

### Track Amendment
\`\`\`clarity
(contract-call? .amendment-tracking create-amendment
u1
0xabcdef1234567890
"Terms Update"
"Updated payment terms and delivery schedule"
)
\`\`\`

## Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
npm test
\`\`\`

Tests cover:
- Contract deployment and initialization
- Firm registration and verification
- Contract creation and management
- Amendment tracking and approval
- Compliance monitoring
- Renewal automation

## Security Considerations

- All contracts include proper authorization checks
- Only verified legal firms can perform certain operations
- Contract ownership is properly managed through tokenization
- Amendment approval requires contract creator authorization
- Compliance checks can only be performed by verified firms

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please open an issue in the GitHub repository.
\`\`\`

Now let me create the PR details file:

