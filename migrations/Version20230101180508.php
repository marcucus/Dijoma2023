<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230101180508 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE act_photos DROP FOREIGN KEY FK_FC72FD179B0F88B1');
        $this->addSql('ALTER TABLE act_photos ADD CONSTRAINT FK_FC72FD179B0F88B1 FOREIGN KEY (activite_id) REFERENCES act_photos (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE act_photos DROP FOREIGN KEY FK_FC72FD179B0F88B1');
        $this->addSql('ALTER TABLE act_photos ADD CONSTRAINT FK_FC72FD179B0F88B1 FOREIGN KEY (activite_id) REFERENCES activite (id)');
    }
}
