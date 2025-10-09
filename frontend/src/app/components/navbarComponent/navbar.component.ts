import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-navbar',
  standalone: true,
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss']
})
export class NavbarComponent {
  constructor(private router: Router) { }

  navigateToDocs() {
    this.router.navigate(['/docs']);
  }

  navigateToAbout() {
    this.router.navigate(['/about']);
  }

  connectWallet() {
    // Add wallet connection logic here
    console.log('Connect wallet button clicked');
  }
}

